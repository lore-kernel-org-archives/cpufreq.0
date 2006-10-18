From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7383] cpu frequency switching seems to be broken (on Intel
	Conroe 6600), frequencies being shown are wrong
Date: Wed, 18 Oct 2006 03:47:09 -0700
Message-ID: <200610181047.k9IAl9sn012595@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7383





------- Additional Comments From miura@da-cha.org  2006-10-18 03:34 -------
This looks like a problem of ACPI BIOS.
The scaling_available_frequencies may be retrieved from ACPI BIOS table,
so it seems to be broken or not to be configured properly.

Recent BIOS is ver 1407 Oct 3rd, 2006, and Asus claims 1101 supports e6600.
http://drivers.softpedia.com/get/BIOS/Asus/Asus-P5W-DH-Deluxe-BIOS-1407.shtml

Could you show more information such as bios version, bios configuration
and binary data of 'cat /proc/acpi/dsdt > dsdt.raw'?



------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
