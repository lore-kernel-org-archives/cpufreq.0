From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7851] cpufreq shows bad/incomplete infos
Date: Fri, 19 Jan 2007 07:22:13 -0800
Message-ID: <200701191522.l0JFMDXY007903@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=7851

alexey.y.starikovskiy@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |INVALID



------- Additional Comments From alexey.y.starikovskiy@intel.com  2007-01-19 07:14 -------
E6300 lowest frequency multiplier is 6. This means that if you have FSB at 
1066MHz, base CPU frequency is 1066/4=266, and lowest frequency your CPU may 
appear at is 266*6=1.6Ghz, exactly what you see. 

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
