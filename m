From: "Steven Finney (Palm GBU)" <Steven.Finney@palm.com>
Subject: RE: cpufreq profiling timer
Date: Thu, 8 Dec 2011 16:37:57 -0800
Message-ID: <5A766795FA0C7A4989A71981F0A3D7EC2B89B6A591@ushqwmb01>
References: <CAK9wHMSBw1H5pX=SiH=p0HT6BdO__8f5Q6+YS-aAirheS4aQaQ@mail.gmail.com>,<201112090122.14639.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201112090122.14639.trenn@suse.de>
Content-Language: en-US
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>, chao xie <xiechao.linux@gmail.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Arjan van de Ven <arjan@linux.intel.com>


_______________________________________
From: cpufreq-owner@vger.kernel.org [cpufreq-owner@vger.kernel.org] On Behalf Of Thomas Renninger [trenn@suse.de]

> Beside powersaving there may also be a performance issue with the
> deferred timer approach. When the cpu is woken up, there may be
> CPU intensive work to do. But the cpufreq subsystem would lower
> frequency because it only knows about the history and does not know
> that a task is scheduled on this CPU now...

That can definitely be a problem on Arm, and it's worse if the sampling rate is relatively slow,
because if you get taken to a low frequency coming out of idle then you'll stay there for the
full duration of the sample. I have observed this. Haven't come up with the perfect
solution yet, though...but it's the exact opposite of what you want. 

sf

