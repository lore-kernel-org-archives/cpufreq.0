From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: intel_pstate divide error with v3.13-rc4-256-gb7000ad
Date: Fri, 03 Jan 2014 12:00:01 -0800
Message-ID: <52C716C1.6070704@gmail.com>
References: <CA+5PVA6YpKc6kYK5UiTnGLZpB8uts=-QPtyhotAyZ2kuoG8PPQ@mail.gmail.com> <4794554.Hmd2RUNYDT@vostro.rjw.lan> <52C18A23.10703@redhat.com> <3710588.K8glfx1cYs@vostro.rjw.lan> <52C6F3B4.3050904@gmail.com> <20140103180435.GK10961@minantech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=LLwiJ4Rd4t4dsQgqbzw2ELovzxUVVxy2cfjxcHO15bE=;
        b=mfzxAqFGUNYxdKtZCc8s36u4zTW8dhZBqf/2jlAsjdy4/eOTOmQ9FlXpNGOqlnR4J/
         8ERjUxy1ROeUBoqoW4aE7o1QZv+UjRpSKQIbD/GzK320iEx5gF/UNnnc0H2rq6kXyulF
         ETgryh0aYNXQxLyTlp1T+a9Gkqeeh7Jlz+5Nzhc4n54o0V2On3RkLG9+cJ6emZliTpNE
         /zD4+5qPvkaDbyRtN6ZusZdXh8FDjToCzYGGXvY7oU1q2YlhRTDq7NdZWSWgllIOCo52
         f8N+SDK1TF/z2enLG7vr4MUAkpAWKwXYWaBSalfWp6kAJuDBU5jIkjuTJHIxpR1jnr8/
         tOcQ==
In-Reply-To: <20140103180435.GK10961@minantech.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Natapov <gleb@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Kashyap Chamarthy <kchamart@redhat.com>, Josh Boyer <jwboyer@fedoraproject.org>, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Viresh Kumar <viresh.kumar@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "Richard W.M. Jones" <rjones@redhat.com>

On 01/03/2014 10:04 AM, Gleb Natapov wrote:
> On Fri, Jan 03, 2014 at 09:30:28AM -0800, Dirk Brandewie wrote:
>> Hi All,
>>
>> Sorry for being late to the party but I just got back from vacation.
>>
>> There is something deeply wrong here.  We should have never gotten to
>> intel_pstate_init_cpu().  The VM had to have returned value from the read
>> of the max pstate at driver init time and 0 when the CPU was being brought up.
>>
>> intel_pstate_msrs_not_valid() was added to solve this issue early on
>> if I remember correctly it was Josh that reported it then.  Is there
>> a definative way to detect whether we are running in a VM?
>>
> Checking for VM is a wrong thing to do here. KVM should behave like it
> does not support p-state.
>
>> Can some one tell me how the nested environment differs in regards to
>> reading MSRs?
>>
> It shouldn't differ, but there may be bug somewhere in nested emulation.
> We shouldn't try and hind the bug by doing more checks in Linux but
> rather fixing KVM bug that causes Linux to behave incorrectly.

Based on the unhandled MSR messages in the host dmesg the following patch
should make sure the correct values are returned for PLAT_FORM_INFO, APERF
and MPERF.  intel_pstate and turbostat are the only users of these registers.

Could you try the folloinw patch minus Rafael's patch please.
Compile tested only.

TIA
--Dirk

commit 5594b89bee7f83200c1a70bf95d50ac35e4fe3f8
Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
Date:   Fri Jan 3 11:44:15 2014 -0800

     x86/kvm: Handle MSR_PLATFORM_INFO, MSR_IA32_MPERF and MSR_IA32_APERF MSRs

     Handle MSRs correctly when read from a nested KVM

     Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
  arch/x86/kvm/x86.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5d004da..390ef27 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2336,6 +2336,9 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, u32 msr, u64 
*pdata)

  	switch (msr) {
  	case MSR_IA32_PLATFORM_ID:
+	case MSR_IA32_MPERF:
+	case MSR_IA32_APERF:
+	case MSR_PLATFORM_INFO:
  	case MSR_IA32_EBL_CR_POWERON:
  	case MSR_IA32_DEBUGCTLMSR:
  	case MSR_IA32_LASTBRANCHFROMIP:

