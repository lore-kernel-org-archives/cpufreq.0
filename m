From: Niklas Edmundsson <Niklas.Edmundsson@hpc2n.umu.se>
Subject: RE: powernow-k8: out of sync on Athlon64 x2 3800+
Date: Thu, 2 Feb 2006 12:12:42 +0100 (MET)
Message-ID: <Pine.GSO.4.64.0602021205040.14848@kleopatra.acc.umu.se>
References: <B3870AD84389624BAF87A3C7B83149930293551F@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <B3870AD84389624BAF87A3C7B83149930293551F@SAUSEXMB2.amd.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "shin, jacob" <jacob.shin@amd.com>
Cc: cpufreq@lists.linux.org.uk, Andreas.Burghart@fujitsu-siemens.com, "Langsdorf, Mark" <mark.langsdorf@amd.com>, linux-kernel@vger.kernel.org, Andi Kleen <ak@suse.de>

On Wed, 1 Feb 2006, shin, jacob wrote:

> Hello,
>
> I don't think this is a BIOS issue, but a kernel bug in the i386 
> tree.  I believe this was recently discussed and hopefully fixed by 
> Andi Kleen in the kernel mailing list:
>
> http://lkml.org/lkml/2006/1/9/442

My symptoms are identical, so it's probably that bug. I guess my bug 
report through FSC's official support channel will bounce eventually 
then ;)

> This is a critical bug especially for systems running AMD Dual-Core 
> Processors on i386 kernel configuration w/ powernow-k8.
>
> The reason for "powernow-k8 - out of sync" errors is because the 
> cpufreq driver is not aware [or has the wrong idea] about which CPUs 
> are tied together, because cpu_core_id and phy_proc_id data is 
> wrong.
>
> Now this is fairly harmless as Mark mentioned, but only on single 
> socket Dual Core systems.

It doesn't crash my machine, but it also doesn't seem capable to 
really lower the clock frequency...

> I was wondering if anyone has already tested Andi's patch, if it 
> successfully solves this problem, and if the patch has made it into 
> the git yet.

I can give the patch a try if you feel that would help, albeit I 
prefer not rebooting my workstation ;)

/Nikke
-- 
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  Niklas Edmundsson, Admin @ {acc,hpc2n}.umu.se     |    nikke@hpc2n.umu.se
---------------------------------------------------------------------------
  Want to forget all your troubles? Wear tight shoes.
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
