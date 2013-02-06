From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Tue, 05 Feb 2013 18:31:57 -0800
Message-ID: <5111C09D.7020007@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com> <1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=nYOf32jKqwwikgBS2oRHwmhZdVug=pLzQZWp-N2S9CGw@mail.gmail.com> <5111BCDA.1060507@gmail.com> <CAOh2x=k8EwdrMzE2qQ+vat47WcmVHzJhZjntPnqNwMqAqibXVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=1haWdKdL7mUmFNI9+1XzSOI/uj0Odu7H1SJGgjPiFUE=;
        b=JTiPAr0pVDh/nrydzUvpXflCqlYfQKE5I0yF0U4q24HbH1vo603rp0/0Y1M5cKkmzr
         U0Wp9O+hsQ16EcNX7Z2Eomc4T0b1c4LWwnGshdwv0zFOgDr1x6Ktk1LXjUla4eGE/pq7
         JpaHYiRH3h53lu2EDKowWdU0MvnkezAo4hiPazEMa06VLk4j/TnfzAmIPd0AFZW509t6
         dnHsrYQdEebuVXqwPcHdGJQwGfEyYkryuH23Aa24aptJe3i39pYL5AFbR+w198oJ0rNI
         IrFKGPrU6Qb+OsuW6710HDixY26oi++Q4Y0VKran3tctyDuTOQgvUoO55R85AmCqiWQl
         9cxg==
In-Reply-To: <CAOh2x=k8EwdrMzE2qQ+vat47WcmVHzJhZjntPnqNwMqAqibXVQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/05/2013 06:25 PM, Viresh Kumar wrote:
> On Wed, Feb 6, 2013 at 7:45 AM, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
>> How about this?
>>
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 2817c3c..9c0eac4 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -1182,7 +1182,12 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
>>
>>          unsigned int ret_freq = 0;
>>
>>          if (policy) {
>> -               ret_freq = policy->cur;
>>
>> +               if (cpufreq_driver && cpufreq_driver->setpolicy &&
>> +                       cpufreq_driver->get) {
>> +                       ret_freq = cpufreq_driver->get(cpu);
>> +               } else {
>> +                       ret_freq = policy->cur;
>> +               }
>>                  cpufreq_cpu_put(policy);

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 2817c3c..7516b7d 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1178,9 +1178,14 @@ static void cpufreq_out_of_sync(unsigned int cpu, 
unsigned int old_freq,
   */
  unsigned int cpufreq_quick_get(unsigned int cpu)
  {
-	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy;
  	unsigned int ret_freq = 0;

+	if (cpufreq_driver && cpufreq_driver->setpolicy &&
+			cpufreq_driver->get)
+			return cpufreq_driver->get(cpu);
+
+	policy = cpufreq_cpu_get(cpu);
  	if (policy) {
  		ret_freq = policy->cur;
  		cpufreq_cpu_put(policy);


