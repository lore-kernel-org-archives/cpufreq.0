From: AthlonRob <AthlonRob@axpr.net>
Subject: 2.4.21 Isn't working for me....
Date: 25 Aug 2003 21:36:57 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1061872616.27076.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Hello list...

I'm trying to get some cpu frequency control over my laptop's CPU with
the 2.4.21 kernel.  I'd just jump to 2.6.0-test4, but have a few pieces
of hardware that don't have drivers available for the test kernel yet.

I downloaded the versions for 2.4 dated August 24th, 25th, and also the
26th.  The ones from the 24th and 25th give the results below, the 26th
errors out during patching.

Is there a different version I should use?  Any solution to the below? 
Am I totally SOL?  :-)

I enabled cpufreq under processor options, enabling the P4 one built-in
(not as a module).  make bzImage spits forth the following:

gcc -D__KERNEL__ -I/home/rob/kernel/linux-2.4.21/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i686  
-nostdinc -iwithprefix include -DKBUILD_BASENAME=cpufreq 
-DEXPORT_SYMTAB -c cpufreq.c
In file included from cpufreq.c:28:
/home/rob/kernel/linux-2.4.21/include/linux/cpufreq.h:41:2: #error fill
in SMP version
cpufreq.c: In function `cpufreq_setup':
cpufreq.c:97: warning: implicit declaration of function `cpufreq_max'
cpufreq.c:97: invalid lvalue in assignment
cpufreq.c:98: warning: implicit declaration of function `cpufreq_min'
cpufreq.c:98: invalid lvalue in assignment
cpufreq.c: In function `cpufreq_restore':
cpufreq.c:192: warning: implicit declaration of function
`cpufreq_current'
cpufreq.c: In function `cpufreq_set':
cpufreq.c:284: invalid lvalue in assignment
cpufreq.c: At top level:
cpufreq.c:413: invalid lvalue in unary `&'
cpufreq.c:413: initializer element is not constant
cpufreq.c:413: (near initialization for `ctl_cpu_vars[0].data')
cpufreq.c:417: initializer element is not constant
cpufreq.c:417: (near initialization for `ctl_cpu_vars[0]')
cpufreq.c:421: invalid lvalue in unary `&'
cpufreq.c:421: initializer element is not constant
cpufreq.c:421: (near initialization for `ctl_cpu_vars[1].data')
cpufreq.c:425: initializer element is not constant
cpufreq.c:425: (near initialization for `ctl_cpu_vars[1]')
cpufreq.c:432: initializer element is not constant
cpufreq.c:432: (near initialization for `ctl_cpu_vars[2]')
cpufreq.c:435: initializer element is not constant
cpufreq.c:435: (near initialization for `ctl_cpu_vars[3]')
cpufreq.c: In function `cpufreq_init':
cpufreq.c:514: invalid lvalue in assignment
cpufreq.c:516: invalid lvalue in assignment
cpufreq.c:519: invalid lvalue in assignment
cpufreq.c:528: invalid lvalue in assignment
make[2]: *** [cpufreq.o] Error 1
make[2]: Leaving directory `/home/rob/kernel/linux-2.4.21/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/home/rob/kernel/linux-2.4.21/kernel'
make: *** [_dir_kernel] Error 2

I'd really appreciate any help you can provide... maybe a -stable
release somewhere instead of what I think are nightly cvs 'builds' ? 
:-)

Thanks..

Rob
