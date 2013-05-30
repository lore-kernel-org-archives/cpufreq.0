From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: cpufreq turbo regression
Date: Thu, 30 May 2013 08:49:58 -0700
Message-ID: <51A77526.5070503@gmail.com>
References: <20130530135246.GA2177@hobo.wolfson.cam.ac.uk> <CAKohponjio66Okm+jWk_w0jN8RJdQyUEk3Y9sbZ7MWzOpamBmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=CcV7tH7ptv4lLlIe9rbWgIX3zWvntQ1+dxE4GxzBYp8=;
        b=uGDULK2bZXE+S0X9RhktBMAhHetAx5VxkwuSiaOmBYStkbBgdiq5tEgDnLjDhqdZn6
         vOQ1ZaU68wvSFolu14hyvHZeraSyAcczjV9HDAgWP+SHrNkq2XoF5pKxFFGeCycg2j8G
         /5aH8IoXfRjs3S+06JNnhamTHu/A1n45yNp7/MnQ5ZRffkn67EYm8V4zgjJVg13bwRsJ
         RqtNNUlfvUJZSOgBExOf2mswvHfxDfvlxKfry7kIDXAHXtStRHnySI+ZYoPgIF44Pkqf
         J4zNBKx4lMWnZyACYnk6mDWITK/edbwLFyBX/I9otZ6FBF0cUwU9IKcEqpXLQG1yUYML
         VrEQ==
In-Reply-To: <CAKohponjio66Okm+jWk_w0jN8RJdQyUEk3Y9sbZ7MWzOpamBmQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, Ross Lagerwall <rosslagerwall@gmail.com>, cpufreq@vger.kernel.org, dirk.brandewie@gmail.com

On 05/30/2013 08:41 AM, Viresh Kumar wrote:
>> Reverting this commit from v3.10-rc3 fixed the problem.
>>
>> This is using the acpi-cpufreq driver -- there doesn't seem to be any way to
>> set the Intel P-state driver to performance by default.
>
> This patch was pretty much sensible and all drivers now depend on it
> now.
>
> @Dirk: Can you please help us in understanding why this might be
> happening. I believe it has to do with some bad design of acpi-cpufreq
> driver (I tried to look into target routine but couldn't understand why
> this might be happening).
>

Not really sorry I don't know any thing about acpi-cpufreq.

> --
> viresh
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

