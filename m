From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: issues on driver CPU
Date: Mon, 30 Nov 2015 15:02:02 +0530
Message-ID: <CAOh2x=k=uikHzFRnFLo50zbhCPTdHbrMQ1NY=9HarSy43S3AFw@mail.gmail.com>
References: <5659F0CE.2060701@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=z6Zm47lHyMjYisE1JI3tNii5NMvClsn71neenMVP77s=;
        b=ZhtEkpqg7l1kbOhLKjb/NfWSpTuZiiyTcY/Q9E0RxlGhXjA+1zglfPbkbrD660oJF+
         Ev2WD1LgKfPeT7SI6jjrhIUX/4q5mb8EZZW4CeACeW4ZNoolVDDswLftWGQdwQHFglqD
         NoP/OiGY2oepAXCqW4VtRP45gdXw5oKSoGPxc3MllNPRREOhT/T9+mr/fzikoCVQ5VLq
         jm4cTQOSNCM0nzyNtsVELUCYKxvkt6Oc5DlF/JtFKp+Zi7XDNSM2W1CSND53gYUv/5Qq
         U7zkfcG1d/LaNhUJ7fOZSuPYXOYcrlV2fKAEXkW9YKwfr6FR3VirBMKOh9SKn37kz6t6
         lLxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=z6Zm47lHyMjYisE1JI3tNii5NMvClsn71neenMVP77s=;
        b=wwIVZ4nDGFYbj7rksc1tVeHUqWfUdMQC03sel0rn3V+U/yvPHTtHuHFClxxs0kAahy
         ASNNxQbBWOWNCCKG7VX8v3IWiKo8cTMAEKRkR0BZJ78KsRsApaK80wHnyOhi6lWUgNM4
         tJHs4Ffh+Tpp7ROsjJVPH7tT1QbpeTfFxxfuvJZjxVpmjYtwX2Tx8ivwORdc4vC/y+pN
         RFWxjk8zFcD9wfbbsPJXzojiFkaTq2JX/tZPxW98OD1cBhK4WcAP0uxNUaf9MIG925+V
         A6STXM4LUIwhT25S8+LH7ho0wBcwWV4ec8/eZDAjlwbVbTDtVvHGuWS0k8p3TmkfzgWU
         abbQ==
In-Reply-To: <5659F0CE.2060701@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Scattolin <lorenzo.scattolin04@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On Sat, Nov 28, 2015 at 11:52 PM, Lorenzo Scattolin
<lorenzo.scattolin04@gmail.com> wrote:
> What driver control my cpu?

You need to read that from:

/sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
