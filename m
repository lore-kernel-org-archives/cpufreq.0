From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10562] Powersave feature not available on VIA C7-D CPU's
Date: Tue, 29 Apr 2008 11:40:11 -0700 (PDT)
Message-ID: <20080429184011.AA604108064@picon.linux-foundation.org>
References: <bug-10562-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10562-3570@http.bugzilla.kernel.org/>
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

http://bugzilla.kernel.org/show_bug.cgi?id=10562





------- Comment #4 from rafalbilski@interia.pl  2008-04-29 11:40 -------
Below discussion from Via Arena forums.

> Dear All,
>
> C7-D Model A (1.5/2 GHz) and model D (1.5 Ghz) dosen't support PowerSaver.
> C7-D Model D (1.8/2 GHz) support PowerSaver (P-States P0-P1).
> The e_powersaver driver of kernel 2.6.21-rc6 need to update for new VIA C7/C7D/C7M/Eden Model D CPU.
> VIA is testing it.
> If the driver was tested by VIA QA approval, VIA will deliver it.
And they did. Patch was available from Viaarena. I don't know it's current
state.
>
> BRs,
> Venus

> Hi Venus,
>
> What are the differences between model A and B.
> Also how can I know which I have?
>
> Thanks! 

> Dear nori,
>
> #cat /proc/cpuinfo
>
> Model A CPU=>
>
> processor : 0
> vendor_id : CentaurHauls
> cpu family : 6
> model : 10
> model name : VIA Esther processor 1500MHz
> stepping : 9
> cpu MHz : 800.040
>
> Model D CPU=>
> processor : 0
> vendor_id : CentaurHauls
> cpu family : 6
> model : 13
> model name : VIA C7-M Processor 2000MHz
> stepping : 0
> cpu MHz : 2000.022
>
> BRs,
> Venus


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
