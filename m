From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: support acpi
Date: Fri, 2 Apr 2004 18:24:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402162447.GP19001@poupinou.org>
References: <99F2150714F93F448942F9A9F112634C1163C8D7@txexmtae.amd.com>
	<20040321185417.GA7969@dominikbrodowski.de>
	<20040326122931.GA321@elf.ucw.cz>
	<20040401235635.GA25744@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040401235635.GA25744@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Andrew Morton <akpm@osdl.org>, mark.langsdorf@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>, Pavel Machek <pavel@ucw.cz>, paul.devriendt@amd.com, Dominik Brodowski <linux@dominikbrodowski.de>

On Fri, Apr 02, 2004 at 12:56:35AM +0100, Dave Jones wrote:
> On Fri, Mar 26, 2004 at 01:29:32PM +0100, Pavel Machek wrote:
>  > This is new version of powernow-k8 driver. It adds SMP support, and
>  > support for getting tables through ACPI. (ACPI support is really
>  > important, because many machines have broken "legacy" tables). Please
>  > apply,
> 
> First off, apologies for sitting on this for so long.
> I just made a first-pass attempt at merging this. Most of
> (maybe all?) the simpler bits are in (whitespace changes, typos etc).
> I'll push that out to bkbits soon, so the powernow-k8 diff in the
> next -mm that Andrew builds should be slightly smaller at least.
> 
> The ACPI stuff I'm pondering.
> Bruno, how does this stuff look to you? Your acpi perflib stuff is
> already in the pending pool (see the diff in the current -mm tree at
> http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.5-rc3/2.6.5-rc3-mm4/broken-out/bk-cpufreq.patch)

This is Dominik work.  Not mine.

> Would this driver be better off using that ?

At first, yes, it's needed anyway for the SMP case if I'm correct (there is
a flaw in how the v1.4 psb header have been changed wrt 1.2 that make that
impossible apparently).

But I can't say for sure which have to be favored: legacy or ACPI.
I don't have enough dump of ACPI tables and PSB/PST from machines shipped
with AMD64.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
