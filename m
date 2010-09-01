From: Tiago Marques <tiagomnm@gmail.com>
Subject: Re: Speedstep on Celeron SU2300
Date: Thu, 2 Sep 2010 00:17:14 +0100
Message-ID: <AANLkTimd_NCXtsWcSzWhiBNx_v1UUb7CXSYTkiXFL1ne@mail.gmail.com>
References: <AANLkTiktJ5Xgnsmq2je7T3Yc5Sf53Bu8vWMM1XT1V_vm@mail.gmail.com>
 <AANLkTikhSK8ep1y7y8NJpJamGm0bhpqkWscYEx-era0h@mail.gmail.com>
 <AANLkTimq+M43QmZsW_FQX7=djANa=WRbqpk0hA6HVoFy@mail.gmail.com> <201009020040.22388.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=DU/FafRL4SOwMWY6N58DxCS3IcLiCLIaC3gSs0wj2Jc=;
        b=XW2cP7WWgd3Ff50i42NhjyGF2mXCXBRiQOkOILRFzc7s5lUUPYm+Oz9CjmhxUmuc5E
         r0ctjUVzMd9rB8FR7S1e+Kre6Ya+0H3qZOA6kdWul2Ew2cLhUjI+J7p947754LCS7wd7
         YL8prFZi/lTU7gr3Zdt3KvAZCWi7j1ioKKyHQ=
In-Reply-To: <201009020040.22388.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Renninger <trenn@suse.de>
Cc: cpufreq@vger.kernel.org

Hi Thomas. Thanks for the message.

On Wed, Sep 1, 2010 at 11:40 PM, Thomas Renninger <trenn@suse.de> wrote=
:
> On Sunday 29 August 2010 06:54:44 Tiago Marques wrote:
>> Hi,
>> I'm having a problem with this processor not having frequency steps
>> and apparently only voltage steps. I find it very strange but that's
>> what Intel's documentation suggests. I can't load acpi-cpufreq becau=
se
>> it doesn't find any device and battery life in linux is suffering
>> around 20% less due to this.
> Where do you have the 20% info from, I doubt you verified it?

Yes. Since it seems no one can't return Windows licenses for refunds
anymore, I have went ahead and booted windows on it, without any
driver installed and just configured it to have frequency scaling
working, which in this case is only voltage scaling.
I measured almost 6 hours of battery life and the processor & chipset
frequently had the fan stop when idling.

In linux, in the same conditions, I got less than 4 hours and the fan
never stops. I configured a PCI-express power saving feature on the
kernel and it seems to have dropped noise a bit. Battery life is still
not great and the fan still never stops. I'm trying to find something
with which I can measure the actual power going through the AC adapter
but for now battery life tests is pretty much all I can do.
The 20% figure is obviously optimistic since I'm accounting a positive
effect from the PCI-Express power saving feature to not quote 33%
less.

>
>> I have confirmed that the CPU supports
>> Speedstep, just this very strange variation.
> You are not the only one:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D16072
> [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all ( Intel Celeron =
U2300 )
> or the last comments (or search for U2300) here:
> http://software.intel.com/en-us/articles/enhanced-intel-speedstepr-te=
chnology-and-demand-based-switching-on-linux/
>
>> Can I somehow help with this to get it fixed? Who are the current ma=
intainers?
> Not exporting cpu frequencies seem to be intended for this cpu for wh=
atever reasons.

It doesn't have more than one. I checked in windows and I also can't
change frequency, despite reports from a person on the contrary:

http://scottiestech.info/2010/02/05/how-to-increase-your-laptops-batter=
y-life-a-lot-with-crystalcpuid/

I have confirmed that the GM45 chipset doesn't support frequency
scaling of the FSB on Intel's datasheet, so the speed he reports of
98MHz is a bug. I found similar frequencies upon use. Since I
performed my tests with LCD brightness in full, that would account for
the one hour difference on the best result, while the less than four
hours he also reports may be due to speedstep not working before he
messed with configurations.

I tried the same program and the CPU is locked at 6x, although the
voltage isn't, it's somewhere from 0.925 to 1.075v if I recall
correctly.

> If you have efficient C-states, frequency states are not that importa=
nt.

I know. But what about voltage? Intel's datasheet clearly states this
processor supports two voltage states, I guess for the purpose of
relaxing clock binning requirements for these CPUs. I'm thinking it
does scale when in windows.
The Pentium SU4100 has similar problems but he allows one p-state,
from 1300MHz to 1200MHz.
I can't seem to find the lowest multiplier available on these
platforms, CrystalCPUID lists mine as 6x, hence 1200MHz. I thought
Core 2's could idle at something like 800MHz and I find it strange
that this one can't also.

> You could try msr-tools to access frequency switching MSRs directly.
> But you need to know the supported frequencies. Intel generally publi=
shes
> such documentation for all of their released CPUs.
>
> You could then try to set the frequency by:
> FREQUENCY=3D"max/min_freq_from Intel spec"
> modprobe msr
> wrmsr --processor X 0x199 $FREQUENCY
>
> This is not a solution, but you could figure out whether switching wo=
rks
> at all and if, you could test whether you really have 20% more of bat=
tery life time,
> but I expect you won't get that much.

That probably won't work, given my tests in windows. Can I do that for
the voltage also? I also tried the linux-phc modules for debugging but
it also doesn't load.

Best regards,
Tiago

>
> =C2=A0 =C2=A0 =C2=A0Thomas
>
