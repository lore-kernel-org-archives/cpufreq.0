From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10383] CPU FREQ policy value scaling_max_freq gets stuck at
	800MHz on core2duo
Date: Wed,  2 Apr 2008 11:55:40 -0700 (PDT)
Message-ID: <20080402185540.73D3A10805E@picon.linux-foundation.org>
References: <bug-10383-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10383-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10383





------- Comment #14 from ralf.kaestner@web.de  2008-04-02 11:55 -------
thx, I got that, anyhow - suspend/resume is not even working at all on my
laptop (will test that later) So I will test this Anti-V*sta option for a while
and leave the bug open as reference. kernel dev may decide to close it as
duplicate of 9919. However, seems that the Lifebook W 8010 needs some
blacklisting as well. The acpi table error mentioned in comment #8 is gone with
putting the acpi_osi option in.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
