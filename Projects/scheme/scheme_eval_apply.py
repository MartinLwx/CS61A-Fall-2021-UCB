import sys
import os

from pair import *
from scheme_utils import *
from ucb import main, trace

import scheme_forms

##############
# Eval/Apply #
##############


def scheme_eval(expr, env, _=None):  # Optional third argument is ignored
    """Evaluate Scheme expression EXPR in Frame ENV.

    >>> expr = read_line('(+ 2 2)')
    >>> expr
    Pair('+', Pair(2, Pair(2, nil)))
    >>> scheme_eval(expr, create_global_frame())
    4
    """
    # Evaluate atoms
    if scheme_symbolp(expr):
        return env.lookup(expr)
    elif self_evaluating(expr):
        return expr

    # All non-atomic expressions are lists (combinations)
    if not scheme_listp(expr):
        raise SchemeError("malformed list: {0}".format(repl_str(expr)))

    first, rest = expr.first, expr.rest
    if scheme_symbolp(first) and first in scheme_forms.SPECIAL_FORMS:
        return scheme_forms.SPECIAL_FORMS[first](rest, env)
    else:
        # Evaluate the operator(first argument)
        operator = scheme_eval(first, env)
        validate_procedure(operator)
        # Evaluate all of the operands(other arguments)
        from functools import partial

        operands = rest.map(partial(scheme_eval, env=env))

        return scheme_apply(operator, operands, env)


def scheme_apply(procedure, args, env):
    """Apply Scheme PROCEDURE to argument values ARGS (a Scheme list) in
    Frame ENV, the current environment."""
    validate_procedure(procedure)
    if isinstance(procedure, BuiltinProcedure):
        # Convert the Scheme list to a Python list of arguments
        args_list = []
        pos = args
        while pos is not nil:
            if pos.first is not nil:
                args_list.append(pos.first)
            else:
                args_list.append(nil)
            pos = pos.rest
        # Add the current environment if procedure.expect_env == True
        if procedure.expect_env:
            args_list.append(env)
        # Call procedure.py_func on all arguments
        try:
            return procedure.py_func(*args_list)
        except TypeError as e:
            raise SchemeError(f"incorrect number of arguments, {e}")
    elif isinstance(procedure, LambdaProcedure):
        child_frame = procedure.env.make_child_frame(procedure.formals, args)
        return eval_all(procedure.body, child_frame)
    elif isinstance(procedure, MuProcedure):
        child_frame = env.make_child_frame(procedure.formals, args)
        return eval_all(procedure.body, child_frame)
    else:
        assert False, "Unexpected procedure: {}".format(procedure)


def eval_all(expressions, env):
    """Evaluate each expression in the Scheme list EXPRESSIONS in
    Frame ENV (the current environment) and return the value of the last.

    >>> eval_all(read_line("(1)"), create_global_frame())
    1
    >>> eval_all(read_line("(1 2)"), create_global_frame())
    2
    >>> x = eval_all(read_line("((print 1) 2)"), create_global_frame())
    1
    >>> x
    2
    >>> eval_all(read_line("((define x 2) x)"), create_global_frame())
    2
    """
    if expressions is nil:
        return None
    res = scheme_eval(expressions.first, env)
    if expressions.rest is nil:
        return res
    else:
        return eval_all(expressions.rest, env)


##################
# Tail Recursion #
##################


class Unevaluated:
    """An expression and an environment in which it is to be evaluated."""

    def __init__(self, expr, env):
        """Expression EXPR to be evaluated in Frame ENV."""
        self.expr = expr
        self.env = env


def complete_apply(procedure, args, env):
    """Apply procedure to args in env; ensure the result is not an Unevaluated."""
    validate_procedure(procedure)
    val = scheme_apply(procedure, args, env)
    if isinstance(val, Unevaluated):
        return scheme_eval(val.expr, val.env)
    else:
        return val


def optimize_tail_calls(original_scheme_eval):
    """Return a properly tail recursive version of an eval function."""

    def optimized_eval(expr, env, tail=False):
        """Evaluate Scheme expression EXPR in Frame ENV. If TAIL,
        return an Unevaluated containing an expression for further evaluation.
        """
        if tail and not scheme_symbolp(expr) and not self_evaluating(expr):
            return Unevaluated(expr, env)

        result = Unevaluated(expr, env)
        # BEGIN PROBLEM EC
        "*** YOUR CODE HERE ***"
        # END PROBLEM EC

    return optimized_eval


################################################################
# Uncomment the following line to apply tail call optimization #
################################################################
# scheme_eval = optimize_tail_calls(scheme_eval)
