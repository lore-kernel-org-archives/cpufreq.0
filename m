From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10982] scaling_max_freq locked - Thinkpad T42
Date: Fri, 27 Jun 2008 11:43:28 -0700 (PDT)
Message-ID: <20080627184328.C6719108047@picon.linux-foundation.org>
References: <bug-10982-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10982-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10982


len.brown@intel.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |venkatesh.pallipadi@intel.co
                   |                            |m
             Status|NEEDINFO                    |NEW
          Component|cpufreq                     |Power-Processor
            Product|Power Management            |ACPI




------- Comment #5 from len.brown@intel.com  2008-06-27 11:43 -------
since it (seems) PPC related, moving to ACPI category...

re: comment #3, good idea Thomas.
Nicolas, does the problem also go away with CONFIG_ACPI_THERMAL=n?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
