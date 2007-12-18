From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9151] Something broke cpufreq on laptop with lid behavior
	between 2.6.17 and 2.6.23
Date: Mon, 17 Dec 2007 21:11:11 -0800 (PST)
Message-ID: <20071218051111.5D7C110806C@picon.linux-foundation.org>
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


stevenm@umd.edu changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |NEW




------- Comment #10 from stevenm@umd.edu  2007-12-17 21:11 -------
Yup! Stiiilll happening! Extremely annoying. Unplug AC, open lid... 2GHz. And
sometimes it gets STUCK there! That is, set to 600 and it jumps right back to
2GHz. Have to go through some intermediate speed first.

Oh, and it insists on going into 25% throttling when on battery power, but at
least THAT I can set to 0% and it will stay. Still annoying as crap, however.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
