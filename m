From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8075] powernow-k8: MP systems not supported by PSB BIOS
	structure
Date: Wed, 14 Mar 2007 14:04:42 -0700
Message-ID: <200703142104.l2EL4gfE015361@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8075





------- Additional Comments From yann@kierun.org  2007-03-14 14:04 -------
I have the same problem booting from CD (Gentoo, Ubuntu and Fedora core) iwth my
dual AMD64 X2.  Setting the kernel to acpi=off does not work either.  The kernel
panics.

I'm happy to test a new kernel but since I do not have a Linux install, it maybe
hard.  Still, please let me know (yann-AT-kierun-org) if I can test this. 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
