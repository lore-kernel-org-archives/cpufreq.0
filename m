From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC/CFT] cpufreq updates for 2.6.0-test4
Date: Wed, 27 Aug 2003 16:22:06 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030827142206.GA10434@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

Hi,

Here are a couple of patches for linux-2.6.0-test4. A complete set can be
found here:

http://www.brodo.de/cpufreq_tmp/cpufreq-2.6.0-test4-all

Test reports are most welcome.


Individual patches [not sent to the list due to their size, but available at
http://www.brodo.de/cpufreq_tmp/ - just add the file name after the slash.]

cpufreq-2.6.0-test4-move_cpufreq
	Move kernel/cpufreq.c to drivers/cpufreq/cpufreq.c and remove $Id$
	tag.

cpufreq-2.6.0-test4-spelling_fix
	Documentation spelling fix.

cpufreq-2.6.0-test4-rename_userspace
	Rename drivers/cpufreq/userspace.c to
	drivers/cpufreq/cpufreq_userspace.c

cpufreq-2.6.0-test4-fix_userspace
	Fix a couple of oddities in the userspace governor

cpufreq-2.6.0-test4-separate_governors_core
	Completely separate governors from policies. Governors are for
	CPUfreq drivers which have a ->target callback, Polcies are for
	CPUfreq drivers which have a ->setpolicy callback. Also, the
	"hardwired" governors "powersave" and "performance" are removed.

cpufreq-2.6.0-test4-separate_governors_governors
	Add the "performance" and "powersave" governors as modules. Also add
	a config option so that the default governor [which is loaded and
	enabled at boot] is started. Note that if you select "performance"
	here, the CPU will be set to the highest possible frequency even if 
	the CPU was booted at a lower frequency. If you select "userspace",
	the frequency will stay the same.

cpufreq-2.6.0-test4-separate_governors_ppc
cpufreq-2.6.0-test4-separate_governors_sh
cpufreq-2.6.0-test4-separate_governors_sparc64
cpufreq-2.6.0-test4-separate_governors_x86
	Small fixes necessary to separate the governors from policies.

cpufreq-2.6.0-test4-separate_governors_arm
	These changes allow for easier Kconfig usage on ARM. And more
	features for SA11x0 users.


	Dominik
