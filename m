From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7383] cpu frequency switching seems to be broken (on Intel
	Conroe 6600), frequencies being shown are wrong
Date: Wed, 18 Oct 2006 09:27:40 -0700
Message-ID: <200610181627.k9IGReTe031389@fire-2.osdl.org>
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

venkatesh.pallipadi@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEW                         |ASSIGNED



------- Additional Comments From venkatesh.pallipadi@intel.com  2006-10-18 09:15 -------
This seems to be broken BIOS _PSS table. Can you attach the entire acpidump 
output. You can find acpidump in latest version of pmtools here

http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
