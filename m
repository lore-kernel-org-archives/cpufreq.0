From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6851] Suspend to RAM and Ondemand Lockup/Stack trace
Date: Wed, 26 Jul 2006 02:10:16 -0700
Message-ID: <200607260910.k6Q9AGaB020424@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6851

pavel@suse.cz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pavel@suse.cz



------- Additional Comments From pavel@suse.cz  2006-07-26 02:06 -------
On lkml, there's currently discussion about ondemand's locking being termianlly
broken. This is probably one of the symptoms

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
