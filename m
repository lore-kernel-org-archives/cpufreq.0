From: Len Brown <lenb@kernel.org>
Subject: Re: [RFC 0/3] Experimental patchset for CPPC
Date: Fri, 15 Aug 2014 18:22:10 -0400
Message-ID: <CAJvTdK=hYS87BKZ0NcX7U3RJRmUHWGhC6krSTTmN8O2MO9BK=A@mail.gmail.com>
References: <1408046230-16439-1-git-send-email-ashwin.chaugule@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=YtOzzHd8dy+59ztm0cxuVLrKQWDeXYc27EyNKt8qnk0=;
        b=dJZB2fdeVVGvCpelypyML13oK5BMZubD8kW788cQt1NfmalXW4wYCsJLQG3/7yNNfq
         9jGAL7Dti3h4Jzg0IxLfRkc/mhohOrSvX5HY59sjQ2NZkcH9frudHNBtqCxYXPeZtQD5
         bGGwyTWfhNTFtCf7uuP+4OTAiA7VDk51VHgDfjpaN6l0IQQIC+fMFePJds2AFXzbRiF5
         iAZuIqbOIxTsMv5GL7Ylq0zExuHt0PAx6HDbVUifHi5fOYwJ4n2Amz1B23Mgvs9KDBFv
         6MqV/qWs/j+6d/fIL9IbRHnKtAa3OMP4Us7bD6hTfO754Bn/850wIpKQrenwifoaicNV
         WYAg==
In-Reply-To: <1408046230-16439-1-git-send-email-ashwin.chaugule@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashwin Chaugule <ashwin.chaugule@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mike Turquette <mike.turquette@linaro.org>, Morten Rasmussen <morten.rasmussen@arm.com>, Arjan van de Ven <arjan@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Brown, Len" <len.brown@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.ne>, "linaro-acpi@lists.linaro.org" <linaro-acpi@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux acpi <linux-acpi@vger.kernel.org>, cpufreq@vger.kernel.org, Patch Tracking <patches@linaro.org>

> I verified that CPU freq requests were taken by reading out the PERF_STATUS register.

Don't use the x86 PERF_STATUS register -- it will not tell you what
you want to know.

If you want to see the actual frequency, you need to watch how many
cycles elapse per a known time interval,
which is how intel_pstate and the turbostat utility do it.

cheers,
Len Brown
Intel Open Source Technology Center
