From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9177] speedstep_centrino can't find device any more
Date: Fri, 21 Dec 2007 21:48:52 -0800 (PST)
Message-ID: <20071222054852.9EC88108011@picon.linux-foundation.org>
References: <bug-9177-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9177-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9177


protasnb@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |davej@codemonkey.org.uk




------- Comment #3 from protasnb@gmail.com  2007-12-21 21:48 -------
There is a plan to use acpi-cpufreq, so it's a good news. As for breakage of
speedstep-centrino, maybe you can enable ACPI_DEBUG and provide dmesg and
/var/log/messages while inserting the module. 
Have you tried latest kernel by chance?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
