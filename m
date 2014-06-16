From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 77201] CPU online hangs, works when powernow-k8 is UN-loaded
Date: Mon, 16 Jun 2014 12:11:20 +0000
Message-ID: <bug-77201-12968-YXb0A19t1s@https.bugzilla.kernel.org/>
References: <bug-77201-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-77201-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D77201

--- Comment #90 from Mauro <registosites@hotmail.com> ---
I've tried (from your tree, but I suppose that doesn't matter):
20d1c86 sched/clock, x86: Rewrite cyc2ns() to avoid the need to disable=
 IRQs
57c67da sched/clock, x86: Move some cyc2ns() code around
5dd12c21 sched/clock, x86: Use mul_u64_u32_shr() for native_sched_clock=
()
62b94a0 sched/preempt: Take away preempt_enable_no_resched() from modul=
es

and all of them fail to compile. Looking at the bisect log I attached w=
hen
submitting the bug report, I see that all of them are the same I had to=
 skip
because they would not compile.

They all fail with:

CC      arch/x86/kernel/asm-offsets.s
In file included from include/linux/spinlock.h:271:0,
                 from include/linux/mmzone.h:7,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:14,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/spinlock_api_smp.h: In function =E2=80=98__raw_spin_lock_=
bh=E2=80=99:
include/linux/spinlock_api_smp.h:134:2: error: implicit declaration of =
function
=E2=80=98__local_bh_disable_ip=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
  __local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
  ^
include/linux/spinlock_api_smp.h:134:34: error: =E2=80=98SOFTIRQ_LOCK_O=
=46FSET=E2=80=99
undeclared (first use in this function)
  __local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                  ^
include/linux/spinlock_api_smp.h:134:34: note: each undeclared identifi=
er is
reported only once for each function it appears in
include/linux/spinlock_api_smp.h: In function =E2=80=98__raw_spin_unloc=
k_bh=E2=80=99:
include/linux/spinlock_api_smp.h:176:2: error: implicit declaration of =
function
=E2=80=98__local_bh_enable_ip=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
  __local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
  ^
include/linux/spinlock_api_smp.h:176:33: error: =E2=80=98SOFTIRQ_LOCK_O=
=46FSET=E2=80=99
undeclared (first use in this function)
  __local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                 ^
include/linux/spinlock_api_smp.h: In function =E2=80=98__raw_spin_trylo=
ck_bh=E2=80=99:
include/linux/spinlock_api_smp.h:181:34: error: =E2=80=98SOFTIRQ_LOCK_O=
=46FSET=E2=80=99
undeclared (first use in this function)
  __local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                  ^
In file included from include/linux/spinlock_api_smp.h:190:0,
                 from include/linux/spinlock.h:271,
                 from include/linux/mmzone.h:7,
                 from include/linux/gfp.h:4,
                 from include/linux/slab.h:14,
                 from include/linux/crypto.h:24,
                 from arch/x86/kernel/asm-offsets.c:8:
include/linux/rwlock_api_smp.h: In function =E2=80=98__raw_read_lock_bh=
=E2=80=99:
include/linux/rwlock_api_smp.h:175:34: error: =E2=80=98SOFTIRQ_LOCK_OFF=
SET=E2=80=99 undeclared
(first use in this function)
  __local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                  ^
include/linux/rwlock_api_smp.h: In function =E2=80=98__raw_write_lock_b=
h=E2=80=99:
include/linux/rwlock_api_smp.h:202:34: error: =E2=80=98SOFTIRQ_LOCK_OFF=
SET=E2=80=99 undeclared
(first use in this function)
  __local_bh_disable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                  ^
include/linux/rwlock_api_smp.h: In function =E2=80=98__raw_read_unlock_=
bh=E2=80=99:
include/linux/rwlock_api_smp.h:251:33: error: =E2=80=98SOFTIRQ_LOCK_OFF=
SET=E2=80=99 undeclared
(first use in this function)
  __local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                 ^
include/linux/rwlock_api_smp.h: In function =E2=80=98__raw_write_unlock=
_bh=E2=80=99:
include/linux/rwlock_api_smp.h:275:33: error: =E2=80=98SOFTIRQ_LOCK_OFF=
SET=E2=80=99 undeclared
(first use in this function)
  __local_bh_enable_ip(_RET_IP_, SOFTIRQ_LOCK_OFFSET);
                                 ^
cc1: some warnings being treated as errors
/home/msantos/build/temp/cpufreq_revert/src/linux/./Kbuild:81: recipe f=
or
target 'arch/x86/kernel/asm-offsets.s' failed
make[1]: *** [arch/x86/kernel/asm-offsets.s] Error 1
Makefile:859: recipe for target 'prepare0' failed
make: *** [prepare0] Error 2

--=20
You are receiving this mail because:
You are the assignee for the bug.