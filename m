From: Matt Turner <mattst88@gentoo.org>
Subject: 'cpufreq-set -g performance -r' does not set all CPUs (AMD only?)
Date: Sun, 31 Jul 2011 00:46:31 -0400
Message-ID: <CAEdQ38FJ+Gaa3SABCZEHUUybTdJKsJRnK_yU0nppv=5vvd=zMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Juergen Rose <rose@rz.uni-potsdam.de>

Hi,

I've got a bug report about cpufreq-set -r not setting all related
CPUs. It appears to be a problem with AMD CPUs only.

https://bugs.gentoo.org/show_bug.cgi?id=376565

Any ideas what's going on?

Thanks,
Matt
