From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k7 for XP-M 2400+ CPU
Date: Wed, 26 May 2004 12:30:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040526103012.GL4933@poupinou.org>
References: <20040525225007.2DCE949C52@nathan.muc.de>
	<20040526095144.7917.qmail@web20812.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040526095144.7917.qmail@web20812.mail.yahoo.com>
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
To: Alex Simonov <a_simonov@yahoo.com>
Cc: cpufreq@www.linux.org.uk

On Wed, May 26, 2004 at 02:51:44AM -0700, Alex Simonov wrote:
> Hi, 
> 
> I'm  not sure that you can do it in a so
> straightforward way, as far as I know, mobile and
> desktop Athlon CPUs use slightly different tables
> for the VID codes, so setting a FID/VID
> combination that is known for a Mobile CPU could
> not have the same effect on a desktop CPU.
> 
> I have some experince in that because I upgraded
> my 1GHz Mobile Duron to Athlon XP mobile 1900+ on
> my VAIO FX-502, and I had to hack the cpufreq
> code to add custom table for the CPU scaling
> 
> I used the CrystalCPUID at
> http://crystalmark.info/?lang=en
> to determine the FID/VID pairs that worked for
> me.
> 
> You may also want to see this article about
> mobile<->desktop Athlons CPUs:
> 
> http://www.cpuheat.wz.cz/html/AXP_multiplier/AXP_Multiplier.htm
> 
> A table with the differences in setting VID is
> given there, may be you will have to modify also
> the VID states table that is defined in the
> cpufreq driver.

Well, I will post probably a patch for this difference.  But for the
Cool'n Quiet technology as you refer I guess, it's not possible to
change VID anyway.  Then, I do consider it more as comestic bug for
kernel logs and such.

If the motherboard do allow to change the voltage at runtime, that
is by another way, and I'm afraid this is specific to Asus.

Of course, I may be wrong.  Some motherboard do have a VRM mobile part
instead of a desktop one.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
