From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: intel_pstate divide error with v3.13-rc4-256-gb7000ad
Date: Mon, 06 Jan 2014 09:18:44 -0800
Message-ID: <52CAE574.3010304@gmail.com>
References: <CA+5PVA6YpKc6kYK5UiTnGLZpB8uts=-QPtyhotAyZ2kuoG8PPQ@mail.gmail.com> <4794554.Hmd2RUNYDT@vostro.rjw.lan> <52C18A23.10703@redhat.com> <3710588.K8glfx1cYs@vostro.rjw.lan> <52C6F3B4.3050904@gmail.com> <20140103180435.GK10961@minantech.com> <52C716C1.6070704@gmail.com> <52C7345D.30603@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=gI2PRcIPOeDJKLyEpB3i+AkHHP+FQxgaaOcM4wSTWlA=;
        b=DZUw+WofEpvDeWvnsGLE2pQBIiUxOWYYHSoYbrpUITMDQoQakJk+lQdhdNxhPnUpMQ
         M/NQnyXTIpXSEWEl8gf/++38M7JpOUEV2VqCjLCKyc//XsfoNrXckTmqXyErzzSPehKK
         nU6oAMbwoCTL0SdDFIyFedxmOxzdSfBTgSS6YZcjQmbbzc/EGMTrJaf9Vs8Gxh7WJcG7
         UZfiNFvtNKm4KTVgo15j6NfF1R8a11sNmBRcvtabRbYqv8hUQbxde9ATYqYyaqF/nMfZ
         jbsjTfEiU69L++2VtxW3Xgxg14/9WeYVBzIWl99u4IUTdNwe7+ys1IDso0qyAyg3Ndj1
         9Xtw==
In-Reply-To: <52C7345D.30603@redhat.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gleb Natapov <gleb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kashyap Chamarthy <kchamart@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "Richard W.M. Jones" <rjones@redhat.com>

On 01/03/2014 02:06 PM, Paolo Bonzini wrote:
> Il 03/01/2014 21:00, Dirk Brandewie ha scritto:
>> +    case MSR_IA32_MPERF:
>> +    case MSR_IA32_APERF:
>
OK I will spin the patch to only add MSR_PLATFORM_INFO.

> These should never be accessed.  A KVM VM will always have
> CPUID[06H].ECX = 0, and the Intel manual says that the MSRs are only
> present if CPUID returns that value with bit 0 set.
>
> I think the actual bug is that intel_pstate_init does not check the
> feature bits in CPUID (either manually or via x86_match_cpu).

I will add the feature check.

What are the differences between the first and the nested KVM's?
At load time intel_pstate checks that APERF and MPERF are incrementing
and that PLATFORM_INFO has some value.  Somehow these checks pass
in the nested environment and we fall over when the CPU is being added
by cpufreq.

--Dirk

