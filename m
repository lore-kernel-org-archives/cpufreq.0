From: Yogesh Kumar <ykumar19874@gmail.com>
Subject: Re: Question on CPU Frequency subsystem
Date: Wed, 9 May 2012 17:56:33 +0200
Message-ID: <CACpnD02ATy-mYo+msdDQjbF83fqETTAbP=qp_N3tz9RvahWpBg@mail.gmail.com>
References: <CACpnD03GRrQ58h9+6zD8hH9hk41FdrfHpgSSGb13mdcNpqxX8w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=oakjclVdcsz+y7G/JYf0wNUQz7XyG8KapO05DLGvjQ0=;
        b=ta4Ts+48cAzVVEmjix+hWmvKeBp/1l1aPGX1imzWyebpVx4IBqd+/SFy3t3BSuOpPT
         uNmciAYqnfOC9C8Gt5qJ+O64KdWler2EBN72GtphH04LJp0XayYYNpHi8DN58NRCAXIu
         JRa5HXf3o473tcOjw0ZT+7SPPHJcJQaFkt039DC22M9G20CaCpjfWE5MtaSYuHoqrJm7
         BsZzxNWrl8G6OGyzbMorsZ2myo9WZ/6nWZRFWnYKLYBMAm8BzlNaOGqRJlqeXFN0Bf54
         DZzSYBxRwJApp4ZpVivOoVxVJ5Ov4mTX6PprNohoI4SkT6l4on3gomFjdSI3RdHKHcHl
         NfuA==
In-Reply-To: <CACpnD03GRrQ58h9+6zD8hH9hk41FdrfHpgSSGb13mdcNpqxX8w@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

 Hi,

 I had a question on CPU Frequency subsystem. As there are multiple
 governors which can be set on different CPU cores. If we have 4 cores
 lying under the one power domain and voltage rail and suppose governor
 setting is:

 cpu0: performance
 cpu1: on demand
 cpu2: on demand
 cpu3: performance

 Since All cores are lying under same power rails, as we set the cpu0
 to performance governor which will set the cpu0 and cpu3 to maximum
 frequency and hence sustainable voltage for that frequency but cpu1
 and cpu2 are using on demand governor, suppose the load is low on cpu1
 and cpu2 cores, therefore on demand governor will try to set the low
 frequency and voltage based on the load. Since cpu0 is at high
 frequency and cpu1 is at low frequency, which part of cpufreq system
 will restrict the voltage to stay high as voltage rail is shared and
 one cpu is running at low frequency and another at high frequency?

 Regards
 Yogesh
