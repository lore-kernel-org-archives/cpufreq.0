From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8671] CPU frequency always on highest frequency after wakeup
	from suspend to disk
Date: Mon, 25 Jun 2007 23:24:54 -0700 (PDT)
Message-ID: <20070626062454.909811080F7@picon.linux-foundation.org>
References: <bug-8671-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8671-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8671


malattia@linux.it changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |malattia@linux.it




------- Comment #7 from malattia@linux.it  2007-06-25 23:28 -------
Markus, does the attached patch fixes it for you?


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
