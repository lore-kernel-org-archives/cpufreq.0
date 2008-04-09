From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10194] cpufreq P-state tables can change during runtime,
	handle it
Date: Wed,  9 Apr 2008 16:20:24 -0700 (PDT)
Message-ID: <20080409232024.A014B10805E@picon.linux-foundation.org>
References: <bug-10194-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10194-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10194


Matt_Domsch@dell.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |DOCUMENTED




------- Comment #1 from Matt_Domsch@dell.com  2008-04-09 16:20 -------
this functionality is present already, I just didn't know where to find it.  
acpi_processor_ppc_has_changed() is it.  Closing.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
