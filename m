From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8033] CPU loses cpufreq link after offline/online transition
Date: Fri, 27 Apr 2007 08:43:41 -0700
Message-ID: <200704271543.l3RFhfkb017180@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8033





------- Additional Comments From trenn@suse.de  2007-04-27 08:43 -------
Created an attachment (id=11290)
 --> (http://bugzilla.kernel.org/attachment.cgi?id=11290&action=view)
Don't delete cpu_devs data to identify different x86 types in late_initcall

This one should fix it.

Dave, Andi will someone of you pick this one up or do I have to explicitly post
it to lkml or somewhere?

I did test this with i386 -> works and test compiled with and without
CONFIG_HOTPLUG_CPU

---------------------------------
*Unrelated*:
Some change to older or x86_64 kernel I realized:
when doing:

l -d cpu*/cpufreq
drwxr-xr-x cpu0/cpufreq/
lrwxrwxrwx cpu1/cpufreq -> ../../../../devices/system/cpu/cpu0/cpufreq/
drwxr-xr-x cpu2/cpufreq/
lrwxrwxrwx cpu3/cpufreq -> ../../../../devices/system/cpu/cpu2/cpufreq/

then doing:
adalid:/sys/devices/system/cpu # echo 0 >cpu2/online 
adalid:/sys/devices/system/cpu # l -d cpu*/cpufreq
drwxr-xr-x cpu0/cpufreq/
lrwxrwxrwx cpu1/cpufreq -> ../../../../devices/system/cpu/cpu0/cpufreq/

The cpufreq dir in both cores, cpu2 and cpu3 vanishes.
This was on a recent i386 kernel.
I am pretty sure I saw the cpu3/cpufreq getting a real directory when offlining
cpu2 and when adding cpu2 again, cpu2/cpufreq gets linked to cpu3/cpufreq.
This should be the right behaviour, so the kernel is broken here, right?

-> You might want to reply to the list, this one is forwarded to, should be
easiest, don't want to write a separate mail now...

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
