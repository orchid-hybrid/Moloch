#!/bin/sh
grep -v '^#lang racket$' parser.rkt > parser-sane.scm
