From: karthik vm <meetvm@gmail.com>
Subject: Re: Clarification on the DVFS capabilities
Date: Thu, 23 May 2013 12:51:20 -0400
Message-ID: <CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com>
 <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com>
 <CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com> <CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Or2cvsJqUdQ8mfINI9gHz6cY9fUQPOEvUvB7kped2O8=;
        b=JbI78bMSWR1gVv8DjdkLONIl2wALvgyUgX1UpyrV7bJYlDc1oWnE6gidGagCHazSaa
         jg8MZEDJ2bnETijKL1FztsbqCmeMkKAojHeyaAzMXT11RjPQHVgDK2gbh/NaSzTHlx2n
         sp3yCKsDAVNCqa2Y5kCrgCVAu24b1XLflkZ50+4j+pCw9XxNQmmGISU+1xGduS7yIkOC
         x/qyjfNT/3aAEr8/5gIV4zwFdNfpDufBuMfj4sboCVXH/FoY9gwmOCjmrRy6cm60HGee
         nGEmoj6KQ9QMypw64jmsuDaZ6iWOV7sj3qTPXCs4tGkZOoKIWKLSpVjdW6uFEZvjlTWi
         RPBw==
In-Reply-To: <CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq <cpufreq@vger.kernel.org>

Thanks for the pointers. I got my doubts cleared. I have one final
question on EIST which I am still looking for an answer.

In the article (http://software.intel.com/en-us/articles/enhanced-intel-speedstepr-technology-and-demand-based-switching-on-linux/)
the author says that voltage and frequency changes are separated. Does
this mean that even though a chip has chip-wide DVFS where the voltage
is changed simultaneously across all cores, the frequency of each core
can be still changed individually? Kindly let me know your comments.

Thanks,
karthik

On Thu, May 23, 2013 at 6:12 AM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 22 May 2013 21:58, karthik vm <meetvm@gmail.com> wrote:
>> Hi Viresh,
>>
>> Thanks for your quick reply. The output of cpufreq-info command is as below:
>
> So output says exactly what I said to you.
