From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10653] p4-clockmod gets a wrong max clock (1.2GHz insted 1.6GHz)
Date: Sun, 11 May 2008 09:21:36 -0700 (PDT)
Message-ID: <20080511162136.95A6210805E@picon.linux-foundation.org>
References: <bug-10653-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10653-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10653





------- Comment #2 from davej@codemonkey.org.uk  2008-05-11 09:21 -------
the 'frequencies' that p4-clockmod reports are utterly bogus. they always have
been.  This driver doesn't actually scale frequency at all. It does thermal
throttling, which is usually expressed as a percentage.  There's discussion
going on right now on cpufreq-list whether or not to actually just remove
p4-clockmod entirely, as it's a cause of frequent confusion with very few
benefits.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
