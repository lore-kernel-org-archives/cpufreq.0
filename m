From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5951] New: Acer Aspire BIOS 3A29 reports to high min. frequency
Date: Wed, 25 Jan 2006 04:13:15 -0800
Message-ID: <200601251213.k0PCDFqs012592@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5951

           Summary: Acer Aspire BIOS 3A29 reports to high min. frequency
    Kernel Version: 2.6.16-rc1
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: danny@mailmij.org


Acer Aspires used to have cpfreq problems because of broken PST tables. The 
powernow-k7 module works around this by falling back to ACPI. It seems more 
recent BIOS versions (3A29) have the problem again. This causes the cpu speed 
not to drop below 1450 MHz. Perhaps this version should be blacklisted as 
well. For more info, please look here: 
 
http://qa.mandriva.com/show_bug.cgi?id=18746 
 
 
Regards, 
 
Danny

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
