From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH] cpufreq/intel_pstate: Add function to check that all
 MSR's are valid
Date: Wed, 20 Mar 2013 11:28:49 -0700
Message-ID: <5149FFE1.7030706@gmail.com>
References: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com> <5818534.Fj7AtdhPq1@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=POTYisBkUnE0k6TvejAAC7dlur6fVYCTbumHS3KmwEs=;
        b=n6P9cOCkXAyu+f0ZokZxwokUY+aDos62cxBmFf/XOJ2wO3kYkHTKHcXFid2l0cV2JU
         i7IFBjho+0SUVzP+LgpmLEwdoUl3JcehAoY8yClUoswvURrfway084MObWOgNrWc2oSk
         334WiChzQYBcGS5ffy2iKomuUUWW8PMrWnSpiyC4z7wXE31JAQENHLTlQcHD3mQDeJmL
         hO4ZtDycCYB4zk4IyObb9xa2nrtALuvXnGpfOV7MPx8Xq3RH0eY+XsGXOYsp1dvBi7qt
         6CLSPou1MvPXNOBr/akq3ddPNkofo7sk9IuhtOBJtMaKtZf59wIZWWIXqXk5793DH5j8
         AcpA==
In-Reply-To: <5818534.Fj7AtdhPq1@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 03/20/2013 11:28 AM, Rafael J. Wysocki wrote:
> On Wednesday, March 20, 2013 09:17:24 AM dirk.brandewie@gmail.com wrote:
>> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>>
>> Some VMs seem to try to implement some MSRs but not all the registers
>> the driver needs.  Check to make sure all the MSR that we need are
>> available. If any of the required MSRs are not available refuse to
>> load.
>>
>> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
>
> Is this needed for v3.9?  Any pointers to bug reports etc.?
>

Sorry I saw right after I sent the mail that the bug report was missing

     https://bugzilla.redhat.com/show_bug.cgi?id=922923
     Reported-by: Josh Stone <jistone@redhat.com>

Would you like me to spin the patch?

> Rafael
>
>
>> ---
>>   drivers/cpufreq/intel_pstate.c |   26 ++++++++++++++++++++++++++
>>   1 files changed, 26 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
>> index f6dd1e7..cd9c5f4 100644
>> --- a/drivers/cpufreq/intel_pstate.c
>> +++ b/drivers/cpufreq/intel_pstate.c
>> @@ -752,6 +752,29 @@ static struct cpufreq_driver intel_pstate_driver = {
>>
>>   static int __initdata no_load;
>>
>> +static int intel_pstate_msrs_not_valid(void)
>> +{
>> +	/* Check that all the msr's we are using are valid. */
>> +	u64 aperf, mperf, tmp;
>> +
>> +	rdmsrl(MSR_IA32_APERF, aperf);
>> +	rdmsrl(MSR_IA32_MPERF, mperf);
>> +
>> +	if (!intel_pstate_min_pstate() ||
>> +		!intel_pstate_max_pstate() ||
>> +		!intel_pstate_turbo_pstate())
>> +		return -ENODEV;
>> +
>> +	rdmsrl(MSR_IA32_APERF, tmp);
>> +	if (!(tmp - aperf))
>> +		return -ENODEV;
>> +
>> +	rdmsrl(MSR_IA32_MPERF, tmp);
>> +	if (!(tmp - mperf))
>> +		return -ENODEV;
>> +
>> +	return 0;
>> +}
>>   static int __init intel_pstate_init(void)
>>   {
>>   	int cpu, rc = 0;
>> @@ -764,6 +787,9 @@ static int __init intel_pstate_init(void)
>>   	if (!id)
>>   		return -ENODEV;
>>
>> +	if (intel_pstate_msrs_not_valid())
>> +		return -ENODEV;
>> +
>>   	pr_info("Intel P-state driver initializing.\n");
>>
>>   	all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());
>>

