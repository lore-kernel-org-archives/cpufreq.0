From: Josh Boyer <jwboyer@fedoraproject.org>
Subject: Re: intel_pstate divide error with v3.13-rc4-256-gb7000ad
Date: Fri, 27 Dec 2013 08:46:25 -0500
Message-ID: <CA+5PVA60GSC0tTLJWLtVqb5eTPMzrszxtoBnUP8B_Q_60=oGyw@mail.gmail.com>
References: <CA+5PVA6YpKc6kYK5UiTnGLZpB8uts=-QPtyhotAyZ2kuoG8PPQ@mail.gmail.com>
	<CAKohpomqHApogDEXA5LyWk-+B-Y1mwNQ63-wL3PPGz64s_3Dmw@mail.gmail.com>
	<20131227122422.62857cec@alan.etchedpixels.co.uk>
	<20131227124749.GE10961@minantech.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=mVnYxIg2Dxvx+C+GGldIcCHsvBWlUAOJi+Tb87/zxow=;
        b=xJvDjt7ezMSnS2fOb1dwlnmySPHTgK7n8RZI6ssxz84G9KCA7lrSEWJMphSFcEwCKJ
         PevrL245n9Q+hx3S+BZqcznoomqrsNtnMfTfL+juqIHN2RhSPv/thQjYEpBLsPTHih24
         usxNuJvTcAmNn1xcYbKlHFFLxD4K6ZEwjqEXZYRYkrL0pHWzHNFLnYfdHliSqNBHE/YA
         Sn2gwSO/uESY9xNE8Z1nQuohmytlq6u+sqGKGgOR7vGyhv80e4ZpEbmJ16wHfmPPxuwo
         Vr/et7xOofyIv7Lh7lryuuIa7PJxEmE2UiuBtABoAkghJ5G7eOn9srPXJnRZCCkxeKRt
         HCUA==
In-Reply-To: <20131227124749.GE10961@minantech.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gleb Natapov <gleb@kernel.org>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, Dirk Brandewie <dirk.brandewie@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, Kashyap Chamarthy <kchamart@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>

On Fri, Dec 27, 2013 at 7:47 AM, Gleb Natapov <gleb@kernel.org> wrote:
> On Fri, Dec 27, 2013 at 12:24:22PM +0000, One Thousand Gnomes wrote:
>> On Tue, 24 Dec 2013 21:36:01 +0530
>> Viresh Kumar <viresh.kumar@linaro.org> wrote:
>>
>> > Adding Dirk..
>> >
>> > On 24 December 2013 20:06, Josh Boyer <jwboyer@fedoraproject.org> wrote:
>> > > Hi All,
>> > >
>> > > We've had a report [1] that the pstate driver causes KVM guests to
>> > > fail to boot because of a divide error.  See the backtrace below.
>> > >
>> > >     4.839784] Intel P-state driver initializing.
>> > > [    4.859972] Intel pstate controlling: cpu 0
>> > > [    4.867653] cpufreq: __cpufreq_add_dev: ->get() failed
>> >
>> > After a call to ->init(), ->get() is supposed to work.
>> > @Dirk: Any idea why it failed?
>> >
>> > And then I don't know what made this divide by zero to happen :)
>>
>> > > [    4.878127] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
>>
>> Emulator bug perhaps ?
>>
> KVM does not emulate P-states at all. intel_pstate_init() calls
> intel_pstate_msrs_not_valid() before printing "Intel P-state driver
> initializing."  which suppose to fail since it checks that two reads of
> MSR_IA32_APERF return different values, but KVM does not emulate this msr
> at all, so both calls should return zero (KVM suppose to inject #GP, all rdmsrl
> are patched to be rdmsrl_safe in a guest).
>
> Anything interesting in host dmesg? Is it reproducible?

Seems reproducible.  I forgot to link to the actual bug in my original
report, but you can find it here:

https://bugzilla.redhat.com/show_bug.cgi?id=1046317

Adding Richard and Kashyap on CC.

josh
