From: Murali N <nalajala.murali@gmail.com>
Subject: on-demand governor behavior on synchronous MP!!!
Date: Thu, 15 Sep 2011 12:20:09 +0530
Message-ID: <CAF0Txboo4_7egbZPan0cWgQ=XG77x3RscbTjjOw0sN0uen1BJg@mail.gmail.com>
References: <CAF0TxbrWF+wR68vJqT+KxwgEby+aVv0HKxG4LUsPNH2-WnNRug@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=xFx0fw7ZRGrDFfVJiZtYS0TpTOe/x9UqLnwomReJoC0=;
        b=scAvlM93EjKTOg1TMmMrcEdQLWoFVSYbxxvp7yS0y5iYOo3L6//Pzxovu2z5vhAlFD
         XkNFCH/fXs/Ng/500F80eqDkRmvSEL62pK+gNVqTdFoB+QczKlRWp3ZBksbNDKz0E/4+
         Hovbwj6eQQcE77a64uMknqC/BaaryhvlM+K/o=
In-Reply-To: <CAF0TxbrWF+wR68vJqT+KxwgEby+aVv0HKxG4LUsPNH2-WnNRug@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi All,
I have a MP system where both the cores are running synchronously i.e.
both cores run using the same clock.
I would like to know how the "on-demand" governor takes care of this
scenario? There may be a case where both the cores are running but any
one of the core is under loaded, how this is handled in on-demand
governor?
Are there any existing solutions on any of the architectures? If NOT
how do i go for this?

--
Regards,
Murali N
