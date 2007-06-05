From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8228] acpi-cpufreq does not load - Fujitsu Siemens Amilo M1425,
	M1437G - Intel(R) Pentium(R) M
Date: Tue, 5 Jun 2007 01:14:30 -0700
Message-ID: <200706050814.l558EUtX012710@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8228

aystarik@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|venkatesh.pallipadi@intel.co|aystarik@gmail.com
                   |m                           |
             Status|NEW                         |ASSIGNED



------- Additional Comments From aystarik@gmail.com  2007-06-05 01:18 -------
>>>            OperationRegion (SSDT, SystemMemory, 0xFFFF0000, 0xFFFF)
                                                    ^^^^^^^^^^^^^^^^^^
This means cpu freq changing is disabled in BIOS settings. Please look there.

------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
