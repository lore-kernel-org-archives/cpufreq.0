From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10658] thermal shutdown - Dell Precision M20, Latitude D610
Date: Wed, 14 May 2008 04:40:19 -0700 (PDT)
Message-ID: <20080514114019.588A0108061@picon.linux-foundation.org>
References: <bug-10658-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10658-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10658





------- Comment #29 from martin-kernel-bugzilla@earth.li  2008-05-14 04:40 -------
> After you verify that you're running the latest BIOS
> and that it provides no BIOS SETUP knobs related to cooling

I can confirm that the BIOS is the latest version, A06. There are no options
related to cooling in the BIOS setup. 

> and after you re-assemble your thermal solution using arctic-silver
> or whatever and find that it doesn't help...

I am not rebuilding my laptop at this point. Even if some fancy thermal paste
helps, I very much doubt I am the only person with this issue, and Linux should
work for everybody, not just those willing to hack around with the kernel and
disassemble their laptops. I am keeping it as-is for now so that we have a
readily accessible test case.

Matthew - I will test the patches you have posted.


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug, or are watching someone who is.
