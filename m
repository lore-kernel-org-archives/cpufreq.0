From: oscar =?iso-8859-1?Q?hellstr=F6m?= <jag@ele.nu>
Subject: compiling error
Date: Tue, 05 Aug 2003 05:19:21 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <5.2.0.9.0.20030805050305.00c27b18@mail.tiscali.se>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

hi!

i'm rather new to kernel patching, to staart with, anyway.

i've got a acer aspire 1310 series with a amd athlon xp-m 2500+ with 
slackware 9.0, kernel 2.4.21 and it's getting wuite hot and is using the 
batttery really fast so i found some info on cpufeq.
i've applied the patch, tried a few from 
ftp.linux.org.uk/pub/linux/cpufreq, and i can choose power now! in menuconfig.
( ./patching.sh /usr/src/linux )
then i run make dep;make clean
and when i run make bzImage i get this:

-DKBUILD_BASENAME=cpufreq  -DEXPORT_SYMTAB -c cpufreq.c
In file included from cpufreq.c:28:
/usr/src/linux-2.4.21/include/linux/cpufreq.h:41:2: #error fill in SMP version
cpufreq.c: In function `cpufreq_setup':
cpufreq.c:97: warning: implicit declaration of function `cpufreq_max'
cpufreq.c:97: invalid lvalue in assignment
cpufreq.c:98: warning: implicit declaration of function `cpufreq_min'
cpufreq.c:98: invalid lvalue in assignment
cpufreq.c: In function `cpufreq_restore':
cpufreq.c:192: warning: implicit declaration of function `cpufreq_current'
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
make[2]: Leaving directory `/usr/src/linux-2.4.21/kernel'
make[1]: *** [first_rule] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.21/kernel'
make: *** [_dir_kernel] Error 2

hope that i'm not incredably stupid now.

oscar
