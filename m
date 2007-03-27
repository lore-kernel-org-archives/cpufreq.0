From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8264] powernow-k8 module gets stuck switching powerlevels on
	dualcore AMD64
Date: Tue, 27 Mar 2007 12:40:54 -0700
Message-ID: <200703271940.l2RJesT7011280@fire-2.osdl.org>
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

http://bugzilla.kernel.org/show_bug.cgi?id=8264





------- Additional Comments From babassu@postmaster.co.uk  2007-03-27 12:40 -------
Fair enough. I will try to compile some variants and try them.
>>Your issue with 
>>	u32 i = 0;
>>is what, exactly?

I was just glancing at the line
  i = lo & HW_PSTATE_MASK;
just before the loop trying to figure out what is the starting value of
i(fortunately the mask is just 0x07 making for a small number)

I noticed this function too trying to do a delay I think:
count_off_irt(data);

Can we put it inside the do loop after setting the MSR ?

Thank you.



------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
