From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 5985] speedstep-smi not detecting speedstep-capability with
	early Pentium 3 Coppermine
Date: Fri, 3 Feb 2006 08:29:12 -0800
Message-ID: <200602031629.k13GTCiL024444@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=5985

zarhan@cs.tut.fi changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |REJECTED
         Resolution|                            |DOCUMENTED



------- Additional Comments From zarhan@cs.tut.fi  2006-02-03 08:29 -------
Hmm, it seems that this old second-hand laptop does not support Speedstep after
all - it's not mentioned in the specifications when I was able to dig them up.
The BIOS can change processor speeds, (I can see it with /proc/cpuinfo), but
it's not possible to control it from the OS..

Oh well. I didn't even know there were Coppermines that did not support Speedstep.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
