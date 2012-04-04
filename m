From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Wed, 04 Apr 2012 09:48:28 -0700
Message-ID: <4F7C7B5C.6010309@samsung.com>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com> <20120216160250.GP13673@n2100.arm.linux.org.uk> <00aa01ccf084$93c98a70$bb5c9f50$%kim@samsung.com> <20120327074931.GK5611@n2100.arm.linux.org.uk> <4F73B3E1.4080807@samsung.com> <20120404145204.GA24211@n2100.arm.linux.org.uk> <20120404145917.GB1929@redhat.com> <20120404150353.GB24211@n2100.arm.linux.org.uk> <20120404150730.GC24211@n2100.arm.linux.org.uk> <20120404151346.GD24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WszjWQlMYeS/jrvSu/YuWQF4i5RLX8ZBoew4nooPvwI=;
        b=DdoLD7/0YCVrKL4gEh6UqvZIu5iqDMF2F0ESg4gs0bx6atNXRN8zjLSKWsakWKbbWB
         Gz6/jb1CAfqWv2IwB46jjNch1oWO/nkKM1ZfEQ9HM+ZFt7Aprzp0I8bwfaX/+pNk7i1I
         7/SCsbBcGy+ErfTIpiCnK8pO5ZCoRigRFnFXhbqQAWqKT453PiNzhQ1pXiuhDgAUwd75
         2yi6HKcVok07hcTorDUOKeRcTb8p/zWQ1W75EtLAGdH0bxcNbxOUuDxWl0vSVZLY1y50
         HD+7TPEYSX01q49sPouUJlcbpDQzL+MEvp5wAOeePVFifugYoJMpAD1/PuslN2TiKePa
         eQjA==
In-Reply-To: <20120404151346.GD24211@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: 'Dave Jones' <davej@redhat.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org

On 04/04/12 08:13, Russell King - ARM Linux wrote:
> On Wed, Apr 04, 2012 at 04:07:30PM +0100, Russell King - ARM Linux wrote:
>> On Wed, Apr 04, 2012 at 04:03:53PM +0100, Russell King - ARM Linux wrote:
>>> On Wed, Apr 04, 2012 at 10:59:17AM -0400, 'Dave Jones' wrote:
>>>> On Wed, Apr 04, 2012 at 03:52:04PM +0100, Russell King - ARM Linux wrote:
>>>>   >  On Wed, Mar 28, 2012 at 05:59:13PM -0700, Kukjin Kim wrote:
>>>>   >  >  Russell King wrote:
>>>>   >  >>  As predicted, this is breaking other ARM platforms.  Please fix this
>>>>   >  >>  yourself before your crappy code gets pushed into mainline.  Thanks.
>>>>   >  >>
>>>>   >  >  I fixed it.
>>>>   >
>>>>   >  When will we see patches or the fix in mainline?
>>>>
>>>> Just send it to Linus directly.
>>>
>>> 'it'... well, that implies that someone already has a patch.  I've asked
>>> Kukjin to fix the problem which he introduced because exynos is getting
>>> rather complicated, and he'll know what the dependencies should be.  So
>>> far I've yet to see any kind of patch fixing this stuff.
>>>
>>> Meanwhile I'm seeing failing randconfig builds for non-exynos ARM for
>>> about a week due to the lack of dependencies.
>>
>> Actually, given that this has been known about since Feb 13th, I'm now
>> going to ask for the exynos cpufreq updates to be reverted because
>> there's clearly no motivation to fix this crap Kconfig shite.  Having
>> it tossed out of mainline will provide the necessary motivation to get
>> people to fix their own fuckups.
>
> In case it's not clear - the problem applies to _all_ exynos stuff not
> just the one which I had previously sent a patch for and you appear to
> have applied.  Just look at the crap which was spat out today:
>
> http://www.arm.linux.org.uk/developer/build/result.php?type=build&idx=546
>

It should be fixed with submitted patch.
http://www.spinics.net/lists/cpufreq/msg03080.html

Note that, as I said, it happened from this merge window, so it should 
be fixed during this -rc.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
