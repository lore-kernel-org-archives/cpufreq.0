From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium IIIM not recognised
Date: Tue, 16 Sep 2003 11:13:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030916091302.GO11391@poupinou.org>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <16230.17445.337511.852664@gargle.gargle.HOWL>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Kanis <ivank@juliva.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Sep 16, 2003 at 12:58:45AM +0200, Ivan Kanis wrote:
> Hello,
> 
> I applied the patch on my 2.4.21 kernel from Dave Jones's home
> page. The name of the patch was cpufreq-2.4.21-2.gz.
> 
> I have set the following options when compiling the kernel:
> [*] CPU Frequency scaling
> [*]  CPU frequency table helpers
> [*]  "userspace" for userspace frequency scaling
> <*>  Intel Speedstep (ICH)
> 

could you post lspci -v please?

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
