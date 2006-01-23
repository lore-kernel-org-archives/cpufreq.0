From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5934] System locks if cpufreq set to lowest level.
Date: Mon, 23 Jan 2006 06:11:43 -0800
Message-ID: <200601231411.k0NEBht2017931@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5934

mark.langsdorf@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
              Owner|cpufreq@www.linux.org.uk    |mark.langsdorf@amd.com
             Status|NEW                         |ASSIGNED



------- Additional Comments From mark.langsdorf@amd.com  2006-01-23 06:11 -------
Your system has a very weird PN! table.  I'd expect to see several P-states
going between 2.2 GHz and 1.6 GHz, then a 1.0 GHz P-state.

It's also weird that the driver is reporting a 1.0 GHz minimum P-state, but
cpufreq is not reporting that minimum frequency.

Please make sure you have the latest BIOS.

Also, could you turn on cpufreq debugging and recompile your kernel?  I'd like
to see if the driver is providing any additional messages.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
