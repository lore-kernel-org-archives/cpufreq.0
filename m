From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 3/3] cpufreq: Add cpufreq driver for Freescale e500mc SOCs
Date: Wed, 27 Mar 2013 14:13:15 +0530
Message-ID: <CAKohpo=Mj=Nu_tGekdzzLpF-k_3iaLD+gtAt00Yy1OKs9+rnWw@mail.gmail.com>
References: <D07C73A334FF604B95B3CBD2A545D07B0B105004@039-SN2MPN1-013.039d.mgd.msft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <D07C73A334FF604B95B3CBD2A545D07B0B105004@039-SN2MPN1-013.039d.mgd.msft.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Tang Yuantian-B29983 <B29983@freescale.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

On 27 March 2013 12:09, Tang Yuantian-B29983 <B29983@freescale.com> wro=
te:
> Viresh Kumar <viresh.kumar <at> linaro.org> writes:
>> On Tue, Mar 26, 2013 at 8:06 AM,  <Yuantian.Tang <at> freescale.com>
>> > + * struct cpu_data - per CPU data struct
>
>> For your case where you have 8 cpus in a cluster, only one of 8 vari=
ables
>
>> would be used... Better to create an array of struct with elements:
>
>> cpu and data.
>
>>
>
> You are right. But we can=92t use array struct because we don=92t kno=
w the cpu
> numbers
>
> in advance. If we allocate it dynamically, there would complicate thi=
ngs.
>
> Besides, this per cpu data struct would not occupy too memory.
>> > +       struct device_node  *np;
>> > +       struct device_node  *parent;
>> > +       struct cpufreq_frequency_table *table;

Atleast 12 bytes per cpu.

>> > +static DEFINE_PER_CPU(struct cpu_data, cpu_data);

What about:

static DEFINE_PER_CPU(struct cpu_data *, cpu_data);

and allocate them dynamically. So you would save 8 bytes per cpu.

>> > +                       sizeof(struct cpufreq_frequency_table),
>> > GFP_KERNEL);
>
>> sizeof(*table)

You missed this.

>> > +       for (i =3D 0; i < count; i++) {
>
>> > +               table[i].index =3D i;
>
>> > +               clk =3D of_clk_get(data->parent, i);
>
>> > +               table[i].frequency =3D clk_get_rate(clk) / 1000;
>
>> > +               freq_table_redup(table, i);
>
>>
>
>> Don't call it everytime, fix all these in a single call.
>
>>
>
> NO, not all the CPUs use the same frequency table.
>
> Generally, we have one or two frequency tables.
>
> So, this table needs to be established for each cpu.

You didn't get me. Don't call freq_table_redup() for every table
entry. Call it once per policy-init

>> > +static int corenet_cpufreq_verify(struct cpufreq_policy *policy)
>> > +{
>> > +       struct cpufreq_frequency_table *table;
>> > +
>> > +       table =3D (&per_cpu(cpu_data, policy->cpu))->table;
>> > +       if (!table)
>> > +               return -EINVAL;
>
>>
>
>> This should never be true.
>
> don't understand what's your point here. could you elaborate it?

Sure. table should always be vaild. How can this be NULL ever?
