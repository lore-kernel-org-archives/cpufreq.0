From: Dave Jones <davej@redhat.com>
Subject: Re: on-demand governor behavior on synchronous MP!!!
Date: Tue, 20 Sep 2011 11:32:10 -0400
Message-ID: <20110920153209.GA1839@redhat.com>
References: <CAF0TxbrWF+wR68vJqT+KxwgEby+aVv0HKxG4LUsPNH2-WnNRug@mail.gmail.com>
 <CAF0Txboo4_7egbZPan0cWgQ=XG77x3RscbTjjOw0sN0uen1BJg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAF0Txboo4_7egbZPan0cWgQ=XG77x3RscbTjjOw0sN0uen1BJg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Murali N <nalajala.murali@gmail.com>
Cc: cpufreq@vger.kernel.org

On Thu, Sep 15, 2011 at 12:20:09PM +0530, Murali N wrote:
 > Hi All,
 > I have a MP system where both the cores are running synchronously i.e.
 > both cores run using the same clock.
 > I would like to know how the "on-demand" governor takes care of this
 > scenario? There may be a case where both the cores are running but any
 > one of the core is under loaded, how this is handled in on-demand
 > governor?

see policy->related_cpus and ->cpus

	Dave

