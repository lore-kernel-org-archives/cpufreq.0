From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 11170] 2.6.24 w/ nohz=off runs cooler than 2.6.25 tickless
Date: Sun,  3 Aug 2008 22:58:35 -0700 (PDT)
Message-ID: <20080804055835.E3391108035@picon.linux-foundation.org>
References: <bug-11170-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-11170-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

***
*** This list is moving to cpufreq@vger.kernel.org.
*** Please resubscribe to the new list, and send your message there.  Thanks.
***
http://bugzilla.kernel.org/show_bug.cgi?id=11170





------- Comment #4 from yakui.zhao@intel.com  2008-08-03 22:58 -------
Will you please attach the following outputs?
    acpidump --addr 0x7f6d4e23 --length 0x2A8 -o cpu0ist
    acpidump --addr 0x7f6d50cb --length 0xb1  -o cpu1ist
    acpidump --addr 0x7f6d48f4 --length 0x4aa -o cpu0cst
    acpidump --addr 0x7f6d4d9e --length 0x85  -o cpu1cst  

Thanks.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
