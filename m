From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: Cpufreq for 2.4: what is the best source?
Date: Thu, 21 Aug 2003 13:07:11 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3F44A7DF.4040705@basmevissen.nl>
References: <3F3CB378.1000607@basmevissen.nl> <20030815154156.GA1029@brodo.de> <3F409E54.20001@basmevissen.nl> <20030818175357.GC1570@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030818175357.GC1570@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dominik Brodowski <linux@brodo.de>
Cc: Bas Mevissen <sgm@basmevissen.nl>, Cpufreq@www.linux.org.uk

Dominik Brodowski wrote:

>  
> Already done. As Dave's site isn't yet back online, it can temporarily be
> accessed at
> http://www.brodo.de/cpufreq_tmp/cpufreq-2.4.22-rc2-1__.gz
> 

How up to date is this one? It looks like it doesn't work with a ICH4 
P4-M combination. With 2.6.0-test3 it works out of the box.

With speedstep_ich.o and (..._lib.o) loaded, I get:
cd /proc/sys/cpu ; cat *
2000000 # speed_max, which is correct
0       # speed_min
0       # spped_max

BTW where can I find documentation about how to set a different policy 
with the patch above? The documentation in the tree deliberately doesn't 
detail it...

(I mean setting the policy with e.g. echo userspace >/proc/cpufreq)

Bas.
