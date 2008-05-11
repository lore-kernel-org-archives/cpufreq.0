From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10653] p4-clockmod gets a wrong max clock (1.2GHz insted 1.6GHz)
Date: Sun, 11 May 2008 10:35:35 -0700 (PDT)
Message-ID: <20080511173535.A8D1610805E@picon.linux-foundation.org>
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





------- Comment #4 from davej@codemonkey.org.uk  2008-05-11 10:35 -------
actually, odds are that you'll be saving more power with acpi-cpufreq.  When
that switches to 1.2Ghz, you're also running at a lower voltage.

p4-clockmod runs at the same voltage all the time.  It doesn't even change
clock frequency. All it does is insert 'wait' states every N clock cycles.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
