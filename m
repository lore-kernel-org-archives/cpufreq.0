From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10653] p4-clockmod gets a wrong max clock (1.2GHz insted 1.6GHz)
Date: Thu,  8 May 2008 18:18:24 -0700 (PDT)
Message-ID: <20080509011824.AC52110805E@picon.linux-foundation.org>
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





------- Comment #1 from andrea.cimitan@gmail.com  2008-05-08 18:18 -------
Another notice:
I've just done a benchmark (PI calculation) and the 1.2GHz reported using
p4-clockmod is not a fake number, it is _really_ working at 1.2GHz, because
with acpi-cpufreq the PI calculation is done in 14 seconds, while with
p4-clockmod set at full speed I reach PI calculation in 18 seconds.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
