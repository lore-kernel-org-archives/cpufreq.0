From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9615] Bug with cpufreq when using ondemand governor as default
Date: Mon, 24 Dec 2007 10:33:02 -0800 (PST)
Message-ID: <20071224183302.1773C10806A@picon.linux-foundation.org>
References: <bug-9615-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9615-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=9615


piel@lifl.fr changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |piel@lifl.fr




------- Comment #1 from piel@lifl.fr  2007-12-24 10:33 -------
Hi, I confirm this patch fixes my bug, as described there:
http://lkml.org/lkml/2007/11/11/94
So Dave, please apply!

However, I don't think this is a _regression_, as this bug happens only if one
select the ondemand governor as default, which is a new feature of 2.6.24 .


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
