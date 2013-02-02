From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/6] cpufreq: Do not track governor name for scaling
 drivers with internal governors.
Date: Sat, 2 Feb 2013 08:55:52 +0530
Message-ID: <CAOh2x=mSFkTCU1WywdJAyuX4+Z_8EWzFt0z-f8nOfdi1A-wY2Q@mail.gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744343-18690-5-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=+Xbw/GRWyuYl5pQOWbc6aSL/pmRiglM4gBjis5Q23mQ=;
        b=Fdd+8Rr0ZnuFmQbJSDNo7rb9Ph6F5g6a3jvYgseKV/6wDVYOCeRyNXcIgz+DcfZggF
         l116worEENYnHsrwpBInacznPxoRqJGBG/zFyCoiS+S2vq35Ty/otn+OuvOxYjzvB9kh
         QnNIRx97ajnVzbXxIldpRGiGnd84F7lP5+FGB+ihCidlokflX4B/vIR4qTBokJq8oQtw
         ax94jJxwZeU3NcWz61sC73oLaq6NPAb4uC3zUehiFSdOvJ92R+N1CtkwGGPxsBTGVrpH
         c4Td9og96pebDSnd8ndg3okM/d7+s02DqOfDWEQQiqQ0oMQAdgn3UvL2rqbZkIqyB3kI
         kAWQ==
In-Reply-To: <1359744343-18690-5-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Sat, Feb 2, 2013 at 12:15 AM,  <dirk.brandewie@gmail.com> wrote:
> From: Dirk Brandewie <dirk.brandewie@gmail.com>
>
> Scaling drivers that implement internal governors do not have governor
> structures assocaited with them.  Only track the name of the governor
> associated with the CPU if the driver does not implement
> cpufreq_driver.setpolicy()
>
> Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>

Is this rebased on latest stuff? i.e. rafael/bleeding_edge ?

--
viresh
