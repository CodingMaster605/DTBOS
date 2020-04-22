/**
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2020, Anuradha Weeraman
 */

#ifndef LIBK_H
#define LIBK_H

#include <stdarg.h>
#include <stdint.h>
#include <stddef.h>
#include "tty.h"

void*  memcpy(void * restrict dest, const void * restrict src, size_t n);
void*  memset(void *s, int c, size_t n);
char*  strncpy(char * restrict dest, const char * restrict src, size_t n);
int    prints(char *str);
int    putchar(int c);
char*  itoa(size_t value, char* result, int base);
size_t strnlen(const char *s, size_t maxlen);
void   printf(const char *fmt, ...);
void   panic(char *str);

#endif