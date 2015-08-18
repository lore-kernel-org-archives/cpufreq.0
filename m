From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: Changing CPU frequency in atomic (schedule / scheduler_tick)
Date: Tue, 18 Aug 2015 19:36:01 +0530
Message-ID: <20150818140601.GE31148@linux>
References: <CAMefCkCm10Rz3Ou_4gWhXhBzF44mS7K19WQrQF+aF+WC3-mceQ@mail.gmail.com>
 <CAOh2x=nYXetX5251oJ+RLEsMMtis=MazU+ZHzmfsY=XgvnJhXw@mail.gmail.com>
 <CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMefCkDiudnfS2rWWf2Bfev3mOdWiSifO195amsAyLJ7Y4bQqQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guru Prasad <gurupras@buffalo.edu>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 18-08-15, 09:05, Guru Prasad wrote:
> I don't think this will allow me to have a per-process frequency setting.
> 
> The problem I see with this approach is that, the scheduled work is
> run in its own context, which means there will be a context switch.
> When this happens, another instance of the work will be scheduled
> (from schedule() ). I imagine I would need a conditional call to
> schedule_work(). Something like:
> if(!is_kthread(next))
>     schedule_work(...);

There is work in progress on what you are looking for, look for this
thread:

http://marc.info/?l=linux-kernel&m=143077749912612
-- 
viresh
