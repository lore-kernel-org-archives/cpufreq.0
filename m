From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9151] Something broke cpufreq on laptop with lid behavior
	between 2.6.17 and 2.6.23
Date: Tue, 22 Jan 2008 16:43:38 -0800 (PST)
Message-ID: <20080123004338.4F34410806A@picon.linux-foundation.org>
References: <bug-9151-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9151-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9151


trenn@suse.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         AssignedTo|cpufreq@www.linux.org.uk    |trenn@suse.de
             Status|NEW                         |ASSIGNED




------- Comment #11 from trenn@suse.de  2008-01-22 16:43 -------
On a Dell, I expect this is because the BIOS itself sets the frequncy when
(un-)plugging AC behind the kernel's back, instead of sending a ACPI notify
0x80 on the CPU and let the OS reevaluate _PPC and then let the kernel adjust
frequency (it should do this also, but it also sets the freq itself AFAIK).
I try to get a DELL and track this down.
I take over this bug and hope I can set it to a duplicate to bug #9708, these
are the same...


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
You are the assignee for the bug, or are watching the assignee.
